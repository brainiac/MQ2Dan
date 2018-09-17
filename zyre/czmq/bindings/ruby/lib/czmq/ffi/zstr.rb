################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # sending and receiving strings
    # @note This class is 100% generated using zproject.
    class Zstr
      # Raised when one tries to use an instance of {Zstr} after
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
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          "WARNING: "\
          "Objects of type #{self} cannot be destroyed implicitly. "\
          "Please call the correct destroy method with the relevant arguments."
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

      # Receive C string from socket. Caller must free returned string using
      # zstr_free(). Returns NULL if the context is being terminated or the
      # process was interrupted.
      #
      # @param source [::FFI::Pointer, #to_ptr]
      # @return [::FFI::AutoPointer]
      def self.recv(source)
        result = ::CZMQ::FFI.zstr_recv(source)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Receive a series of strings (until NULL) from multipart data.
      # Each string is allocated and filled with string data; if there
      # are not enough frames, unallocated strings are set to NULL.
      # Returns -1 if the message could not be read, else returns the
      # number of strings filled, zero or more. Free each returned string
      # using zstr_free(). If not enough strings are provided, remaining
      # multipart frames in the message are dropped.
      #
      # @param source [::FFI::Pointer, #to_ptr]
      # @param string_p [::FFI::Pointer, #to_ptr]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def self.recvx(source, string_p, *args)
        result = ::CZMQ::FFI.zstr_recvx(source, string_p, *args)
        result
      end

      # De-compress and receive C string from socket, received as a message
      # with two frames: size of the uncompressed string, and the string itself.
      # Caller must free returned string using zstr_free(). Returns NULL if the
      # context is being terminated or the process was interrupted.
      #
      # @param source [::FFI::Pointer, #to_ptr]
      # @return [::FFI::AutoPointer]
      def self.recv_compress(source)
        result = ::CZMQ::FFI.zstr_recv_compress(source)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Send a C string to a socket, as a frame. The string is sent without
      # trailing null byte; to read this you can use zstr_recv, or a similar
      # method that adds a null terminator on the received string. String
      # may be NULL, which is sent as "".
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param string [String, #to_s, nil]
      # @return [Integer]
      def self.send(dest, string)
        result = ::CZMQ::FFI.zstr_send(dest, string)
        result
      end

      # Send a C string to a socket, as zstr_send(), with a MORE flag, so that
      # you can send further strings in the same multi-part message.
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param string [String, #to_s, nil]
      # @return [Integer]
      def self.sendm(dest, string)
        result = ::CZMQ::FFI.zstr_sendm(dest, string)
        result
      end

      # Send a formatted string to a socket. Note that you should NOT use
      # user-supplied strings in the format (they may contain '%' which
      # will create security holes).
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param format [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def self.sendf(dest, format, *args)
        result = ::CZMQ::FFI.zstr_sendf(dest, format, *args)
        result
      end

      # Send a formatted string to a socket, as for zstr_sendf(), with a
      # MORE flag, so that you can send further strings in the same multi-part
      # message.
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param format [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def self.sendfm(dest, format, *args)
        result = ::CZMQ::FFI.zstr_sendfm(dest, format, *args)
        result
      end

      # Send a series of strings (until NULL) as multipart data
      # Returns 0 if the strings could be sent OK, or -1 on error.
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param string [String, #to_s, nil]
      # @param args [Array<Object>] see https://github.com/ffi/ffi/wiki/examples#using-varargs
      # @return [Integer]
      def self.sendx(dest, string, *args)
        result = ::CZMQ::FFI.zstr_sendx(dest, string, *args)
        result
      end

      # Compress and send a C string to a socket, as a message with two frames:
      # size of the uncompressed string, and the string itself. The string is
      # sent without trailing null byte; to read this you can use
      # zstr_recv_compress, or a similar method that de-compresses and adds a
      # null terminator on the received string.
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param string [String, #to_s, nil]
      # @return [Integer]
      def self.send_compress(dest, string)
        result = ::CZMQ::FFI.zstr_send_compress(dest, string)
        result
      end

      # Compress and send a C string to a socket, as zstr_send_compress(),
      # with a MORE flag, so that you can send further strings in the same
      # multi-part message.
      #
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param string [String, #to_s, nil]
      # @return [Integer]
      def self.sendm_compress(dest, string)
        result = ::CZMQ::FFI.zstr_sendm_compress(dest, string)
        result
      end

      # Accepts a void pointer and returns a fresh character string. If source
      # is null, returns an empty string.
      #
      # @param source [::FFI::Pointer, #to_ptr]
      # @return [::FFI::AutoPointer]
      def self.str(source)
        result = ::CZMQ::FFI.zstr_str(source)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Free a provided string, and nullify the parent pointer. Safe to call on
      # a null pointer.
      #
      # @param string_p [::FFI::Pointer, #to_ptr]
      # @return [void]
      def self.free(string_p)
        result = ::CZMQ::FFI.zstr_free(string_p)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zstr_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
