(module
                                                        ;; call imported js function named "jsprint" and it has one param(i32)
  (import "env" "jsprint" (func $jsprint (param i32)))
                                                        ;; define a page memory (i think $145 mean its memory variable name (or byte offset))
                                                        ;; and its size is 64kb (i think "1" mean 64*"1")
  (memory $145 1)
                                                        ;; i think "12" store string "Hello World!".  
  (data (i32.const 12) "Hello World!\00")
                                                        ;; export "pagememory" with $145 (memory variable).
  (export "pagememory" (memory $145))
                                                        ;; function $helloworld is implemented with calling $jsprint to "Hello World" 
  (func $helloworld
    (call $jsprint(i32.const 12))
  )
                                                        ;; export $helloworld function for javascript to call
  (export "helloworld" (func $helloworld))
)