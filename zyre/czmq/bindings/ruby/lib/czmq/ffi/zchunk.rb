################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # work with memory chunks
    # @note This class is 100% generated using zproject.
    class Zchunk
      # Raised when one tries to use an instance of {Zchunk} after
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
          ::CZMQ::FFI.zchunk_destroy ptr_ptr
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

      # Create a new chunk of the specified size. If you specify the data, it
      # is copied into the chunk. If you do not specify the data, the chunk is
      # allocated and left empty, and you can then add data using zchunk_append.
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [CZMQ::Zchunk]
      def self.new(data, size)
        size = Integer(size)
        ptr = ::CZMQ::FFI.zchunk_new(data, size)
        __new ptr
      end

      # Destroy a chunk
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zchunk_destroy(self_p)
        result
      end

      # Resizes chunk max_size as requested; chunk_cur size is set to zero
      #
      # @param size [Integer, #to_int, #to_i]
      # @return [void]
      def resize(size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zchunk_resize(self_p, size)
        result
      end

      # Return chunk cur size
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_size(self_p)
        result
      end

      # Return chunk max size
      #
      # @return [Integer]
      def max_size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_max_size(self_p)
        result
      end

      # Return chunk data
      #
      # @return [::FFI::Pointer]
      def data()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_data(self_p)
        result
      end

      # Set chunk data from user-supplied data; truncate if too large. Data may
      # be null. Returns actual size of chunk
      #
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [Integer]
      def set(data, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zchunk_set(self_p, data, size)
        result
      end

      # Fill chunk data from user-supplied octet
      #
      # @param filler [Integer, #to_int, #to_i]
      # @param size [Integer, #to_int, #to_i]
      # @return [Integer]
      def fill(filler, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        filler = Integer(filler)
        size = Integer(size)
        result = ::CZMQ::FFI.zchunk_fill(self_p, filler, size)
        result
      end

      # Append user-supplied data to chunk, return resulting chunk size. If the
      # data would exceeded the available space, it is truncated. If you want to
      # grow the chunk to accommodate new data, use the zchunk_extend method.
      #
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [Integer]
      def append(data, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zchunk_append(self_p, data, size)
        result
      end

      # Append user-supplied data to chunk, return resulting chunk size. If the
      # data would exceeded the available space, the chunk grows in size.
      #
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [Integer]
      def extend(data, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zchunk_extend(self_p, data, size)
        result
      end

      # Copy as much data from 'source' into the chunk as possible; returns the
      # new size of chunk. If all data from 'source' is used, returns exhausted
      # on the source chunk. Source can be consumed as many times as needed until
      # it is exhausted. If source was already exhausted, does not change chunk.
      #
      # @param source [Zchunk, #__ptr]
      # @return [Integer]
      def consume(source)
        raise DestroyedError unless @ptr
        self_p = @ptr
        source = source.__ptr if source
        result = ::CZMQ::FFI.zchunk_consume(self_p, source)
        result
      end

      # Returns true if the chunk was exhausted by consume methods, or if the
      # chunk has a size of zero.
      #
      # @return [Boolean]
      def exhausted()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_exhausted(self_p)
        result
      end

      # Read chunk from an open file descriptor
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @param bytes [Integer, #to_int, #to_i]
      # @return [Zchunk]
      def self.read(handle, bytes)
        bytes = Integer(bytes)
        result = ::CZMQ::FFI.zchunk_read(handle, bytes)
        result = Zchunk.__new result, true
        result
      end

      # Write chunk to an open file descriptor
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def write(handle)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_write(self_p, handle)
        result
      end

      # Try to slurp an entire file into a chunk. Will read up to maxsize of
      # the file. If maxsize is 0, will attempt to read the entire file and
      # fail with an assertion if that cannot fit into memory. Returns a new
      # chunk containing the file data, or NULL if the file could not be read.
      #
      # @param filename [String, #to_s, nil]
      # @param maxsize [Integer, #to_int, #to_i]
      # @return [Zchunk]
      def self.slurp(filename, maxsize)
        maxsize = Integer(maxsize)
        result = ::CZMQ::FFI.zchunk_slurp(filename, maxsize)
        result = Zchunk.__new result, true
        result
      end

      # Create copy of chunk, as new chunk object. Returns a fresh zchunk_t
      # object, or null if there was not enough heap memory. If chunk is null,
      # returns null.
      #
      # @return [Zchunk]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_dup(self_p)
        result = Zchunk.__new result, true
        result
      end

      # Return chunk data encoded as printable hex string. Caller must free
      # string when finished with it.
      #
      # @return [::FFI::AutoPointer]
      def strhex()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_strhex(self_p)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return chunk data copied into freshly allocated string
      # Caller must free string when finished with it.
      #
      # @return [::FFI::AutoPointer]
      def strdup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_strdup(self_p)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return TRUE if chunk body is equal to string, excluding terminator
      #
      # @param string [String, #to_s, nil]
      # @return [Boolean]
      def streq(string)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_streq(self_p, string)
        result
      end

      # Transform zchunk into a zframe that can be sent in a message.
      #
      # @return [Zframe]
      def pack()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_pack(self_p)
        result = Zframe.__new result, true
        result
      end

      # Transform a zframe into a zchunk.
      #
      # @param frame [Zframe, #__ptr]
      # @return [Zchunk]
      def self.unpack(frame)
        frame = frame.__ptr if frame
        result = ::CZMQ::FFI.zchunk_unpack(frame)
        result = Zchunk.__new result, true
        result
      end

      # Calculate SHA1 digest for chunk, using zdigest class.
      #
      # @return [String]
      def digest()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_digest(self_p)
        result
      end

      # Dump chunk to FILE stream, for debugging and tracing.
      #
      # @param file [::FFI::Pointer, #to_ptr]
      # @return [void]
      def fprint(file)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_fprint(self_p, file)
        result
      end

      # Dump message to stderr, for debugging and tracing.
      # See zchunk_fprint for details
      #
      # @return [void]
      def print()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zchunk_print(self_p)
        result
      end

      # Probe the supplied object, and report if it looks like a zchunk_t.
      #
      # @param self_ [::FFI::Pointer, #to_ptr]
      # @return [Boolean]
      def self.is(self_)
        result = ::CZMQ::FFI.zchunk_is(self_)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zchunk_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
