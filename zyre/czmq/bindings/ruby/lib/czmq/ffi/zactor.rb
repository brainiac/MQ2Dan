################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # provides a simple actor framework
    # @note This class is 100% generated using zproject.
    class Zactor
      # Raised when one tries to use an instance of {Zactor} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zactor_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new callback of the following type:
      # Actors get a pipe and arguments from caller
      #     typedef void (zactor_fn) (
      #         zsock_t *pipe, void *args);
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.fn
        ::FFI::Function.new :void, [:pointer, :pointer], blocking: true do |pipe, args|
          pipe = Zsock.__new pipe, false
          result = yield pipe, args
          result
        end
      end

      # Create a new callback of the following type:
      # Function to be called on zactor_destroy. Default behavior is to send zmsg_t with string "$TERM" in a first frame.
      #
      # An example - to send $KTHXBAI string
      #
      #     if (zstr_send (self, "$KTHXBAI") == 0)
      #         zsock_wait (self);
      #     typedef void (zactor_destructor_fn) (
      #         zactor_t *self);
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.destructor_fn
        ::FFI::Function.new :void, [:pointer], blocking: true do |self_|
          self_ = Zactor.__new self_, false
          result = yield self_
          result
        end
      end

      # Create a new actor passing arbitrary arguments reference.
      # @param task [::FFI::Pointer, #to_ptr]
      # @param args [::FFI::Pointer, #to_ptr]
      # @return [CZMQ::Zactor]
      def self.new(task, args)
        ptr = ::CZMQ::FFI.zactor_new(task, args)
        __new ptr
      end

      # Destroy an actor.
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zactor_destroy(self_p)
        result
      end

      # Send a zmsg message to the actor, take ownership of the message
      # and destroy when it has been sent.
      #
      # @param msg_p [#__ptr_give_ref]
      # @return [Integer]
      def send(msg_p)
        raise DestroyedError unless @ptr
        self_p = @ptr
        msg_p = msg_p.__ptr_give_ref
        result = ::CZMQ::FFI.zactor_send(self_p, msg_p)
        result
      end

      # Receive a zmsg message from the actor. Returns NULL if the actor
      # was interrupted before the message could be received, or if there
      # was a timeout on the actor.
      #
      # @return [Zmsg]
      def recv()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zactor_recv(self_p)
        result = Zmsg.__new result, true
        result
      end

      # Probe the supplied object, and report if it looks like a zactor_t.
      #
      # @param self_ [::FFI::Pointer, #to_ptr]
      # @return [Boolean]
      def self.is(self_)
        result = ::CZMQ::FFI.zactor_is(self_)
        result
      end

      # Probe the supplied reference. If it looks like a zactor_t instance,
      # return the underlying libzmq actor handle; else if it looks like
      # a libzmq actor handle, return the supplied value.
      #
      # @param self_ [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def self.resolve(self_)
        result = ::CZMQ::FFI.zactor_resolve(self_)
        result
      end

      # Return the actor's zsock handle. Use this when you absolutely need
      # to work with the zsock instance rather than the actor.
      #
      # @return [Zsock]
      def sock()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zactor_sock(self_p)
        result = Zsock.__new result, false
        result
      end

      # Change default destructor by custom function. Actor MUST be able to handle new message instead of default $TERM.
      #
      # @param destructor [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_destructor(destructor)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zactor_set_destructor(self_p, destructor)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zactor_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
