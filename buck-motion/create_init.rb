#!/usr/bin/env ruby -wU
require "digest"
srcs = gets.split(" ")
hashed = srcs.map {|s| Digest::SHA256.hexdigest(s) }

def create_dec(s)
  "void MREP_#{s}(void *, void *);"
end

def create_invoke(s)
  "MREP_#{s}(self, 0);"
end

template = <<EOS
#import <Foundation/Foundation.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
    void ruby_init_device_repl(void);
    #{hashed.map{|s|  create_dec(s)}.join("\n")}
int rm_repl_port = 50599;
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
ruby_init_device_repl();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"4.13");
#{hashed.map{|s| create_invoke(s)}.join("\n")}
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
EOS

puts template
