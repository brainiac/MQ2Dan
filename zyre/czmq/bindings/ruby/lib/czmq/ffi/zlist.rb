################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # simple generic list container
    # @note This class is 100% generated using zproject.
    class Zlist
      # Raised when one tries to use an instance of {Zlist} after
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
          ::CZMQ::FFI.zlist_destroy ptr_ptr
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
      # Comparison function e.g. for sorting and removing.
      #     typedef int (zlist_compare_fn) (
      #         void *item1, void *item2);
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.compare_fn
        ::FFI::Function.new :int, [:pointer, :pointer], blocking: true do |item1, item2|
          result = yield item1, item2
          result = Integer(result)
          result
        end
      end

      # Create a new callback of the following type:
      # Callback function for zlist_freefn method
      #     typedef void (zlist_free_fn) (
      #         void *data);
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.free_fn
        ::FFI::Function.new :void, [:pointer], blocking: true do |data|
          result = yield data
          result
        end
      end

      # Create a new list container
      # @return [CZMQ::Zlist]
      def self.new()
        ptr = ::CZMQ::FFI.zlist_new()
        __new ptr
      end

      # Destroy a list container
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zlist_destroy(self_p)
        result
      end

      # Return the item at the head of list. If the list is empty, returns NULL.
      # Leaves cursor pointing at the head item, or NULL if the list is empty.
      #
      # @return [::FFI::Pointer]
      def first()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_first(self_p)
        result
      end

      # Return the next item. If the list is empty, returns NULL. To move to
      # the start of the list call zlist_first (). Advances the cursor.
      #
      # @return [::FFI::Pointer]
      def next()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_next(self_p)
        result
      end

      # Return the item at the tail of list. If the list is empty, returns NULL.
      # Leaves cursor pointing at the tail item, or NULL if the list is empty.
      #
      # @return [::FFI::Pointer]
      def last()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_last(self_p)
        result
      end

      # Return first item in the list, or null, leaves the cursor
      #
      # @return [::FFI::Pointer]
      def head()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_head(self_p)
        result
      end

      # Return last item in the list, or null, leaves the cursor
      #
      # @return [::FFI::Pointer]
      def tail()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_tail(self_p)
        result
      end

      # Return the current item of list. If the list is empty, returns NULL.
      # Leaves cursor pointing at the current item, or NULL if the list is empty.
      #
      # @return [::FFI::Pointer]
      def item()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_item(self_p)
        result
      end

      # Append an item to the end of the list, return 0 if OK or -1 if this
      # failed for some reason (out of memory). Note that if a duplicator has
      # been set, this method will also duplicate the item.
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def append(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_append(self_p, item)
        result
      end

      # Push an item to the start of the list, return 0 if OK or -1 if this
      # failed for some reason (out of memory). Note that if a duplicator has
      # been set, this method will also duplicate the item.
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def push(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_push(self_p, item)
        result
      end

      # Pop the item off the start of the list, if any
      #
      # @return [::FFI::Pointer]
      def pop()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_pop(self_p)
        result
      end

      # Checks if an item already is present. Uses compare method to determine if
      # items are equal. If the compare method is NULL the check will only compare
      # pointers. Returns true if item is present else false.
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [Boolean]
      def exists(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_exists(self_p, item)
        result
      end

      # Remove the specified item from the list if present
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [void]
      def remove(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_remove(self_p, item)
        result
      end

      # Make a copy of list. If the list has autofree set, the copied list will
      # duplicate all items, which must be strings. Otherwise, the list will hold
      # pointers back to the items in the original list. If list is null, returns
      # NULL.
      #
      # @return [Zlist]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_dup(self_p)
        result = Zlist.__new result, true
        result
      end

      # Purge all items from list
      #
      # @return [void]
      def purge()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_purge(self_p)
        result
      end

      # Return number of items in the list
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_size(self_p)
        result
      end

      # Sort the list. If the compare function is null, sorts the list by
      # ascending key value using a straight ASCII comparison. If you specify
      # a compare function, this decides how items are sorted. The sort is not
      # stable, so may reorder items with the same keys. The algorithm used is
      # combsort, a compromise between performance and simplicity.
      #
      # @param compare [::FFI::Pointer, #to_ptr]
      # @return [void]
      def sort(compare)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_sort(self_p, compare)
        result
      end

      # Set list for automatic item destruction; item values MUST be strings.
      # By default a list item refers to a value held elsewhere. When you set
      # this, each time you append or push a list item, zlist will take a copy
      # of the string value. Then, when you destroy the list, it will free all
      # item values automatically. If you use any other technique to allocate
      # list values, you must free them explicitly before destroying the list.
      # The usual technique is to pop list items and destroy them, until the
      # list is empty.
      #
      # @return [void]
      def autofree()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_autofree(self_p)
        result
      end

      # Sets a compare function for this list. The function compares two items.
      # It returns an integer less than, equal to, or greater than zero if the
      # first item is found, respectively, to be less than, to match, or be
      # greater than the second item.
      # This function is used for sorting, removal and exists checking.
      #
      # @param fn [::FFI::Pointer, #to_ptr]
      # @return [void]
      def comparefn(fn)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlist_comparefn(self_p, fn)
        result
      end

      # Set a free function for the specified list item. When the item is
      # destroyed, the free function, if any, is called on that item.
      # Use this when list items are dynamically allocated, to ensure that
      # you don't have memory leaks. You can pass 'free' or NULL as a free_fn.
      # Returns the item, or NULL if there is no such item.
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @param fn [::FFI::Pointer, #to_ptr]
      # @param at_tail [Boolean]
      # @return [::FFI::Pointer]
      def freefn(item, fn, at_tail)
        raise DestroyedError unless @ptr
        self_p = @ptr
        at_tail = !(0==at_tail||!at_tail) # boolean
        result = ::CZMQ::FFI.zlist_freefn(self_p, item, fn, at_tail)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zlist_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
