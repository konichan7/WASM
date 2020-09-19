(module

  (type (;0;) (func (param i32 i32) (result i32)))      ;; for $add $sub $mul $div
  (type (;1;) (func (param i32 i32 i32) (result i32)))  ;; for $main

  (table 4 anyfunc)                                     ;; should make function table for using $call_indirect
  (func $add (type 0) (i32.add (get_local 0) (get_local 1)))
  (func $sub (type 0) (i32.sub (get_local 0) (get_local 1)))
  (func $mul (type 0) (i32.mul (get_local 0) (get_local 1)))

  (elem (i32.const 0) $add $sub $mul)

  (func $main (type 1) (param i32 i32 i32) (result i32) 
                                                        ;; declare block which include return type i32
    (block (result i32)
                                                        ;; define return value to special warning value like -11111111
      (i32.const -11111111)
                                                        ;; if local_value[2](index of function) is greater than or equal to one(1), jump to block ;@0;
                                                        ;; change $check_num to immidiate value like hard coding.
      (br_if 0 (i32.ge_u (get_local 2) (i32.const 3)))
      (br_if 0 (i32.le_u (get_local 2) (i32.const 0)))
      (drop)
      (get_local 0)                                     ;; go to first param of function like $add or $sub or $mul
      (get_local 1)                                     ;; second param
      (get_local 2)                                     ;; indicate function index (top of the stack)
      (call_indirect (type 0))
    )
  )
  (export "main" (func $main))
)