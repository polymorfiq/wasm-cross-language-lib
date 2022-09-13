(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $none_=>_none (func))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (import "env" "report_log" (func $report_log (param i32 i32)))
 (memory $0 17)
 (global $__stack_pointer (mut i32) (i32.const 1048576))
 (global $global$1 i32 (i32.const 1048760))
 (global $global$2 i32 (i32.const 1048768))
 (export "memory" (memory $0))
 (export "alloc_utf8_log" (func $alloc_utf8_log))
 (export "flush_utf8_logs" (func $flush_utf8_logs))
 (export "multiply_by_two" (func $multiply_by_two))
 (export "__data_end" (global $global$1))
 (export "__heap_base" (global $global$2))
 (func $alloc_utf8_log (param $0 i32) (result i32)
  (local $1 i32)
  (local.set $1
   (i32.const 0)
  )
  (block $label$1
   (br_if $label$1
    (i32.gt_u
     (local.get $0)
     (i32.const 30)
    )
   )
   (i32.store offset=1048576
    (i32.const 0)
    (local.tee $1
     (i32.rem_u
      (i32.add
       (i32.load offset=1048576
        (i32.const 0)
       )
       (i32.const 1)
      )
      (i32.const 5)
     )
    )
   )
   (i32.store
    (i32.add
     (local.tee $1
      (i32.mul
       (local.get $1)
       (i32.const 36)
      )
     )
     (i32.const 1048580)
    )
    (local.get $0)
   )
   (local.set $1
    (i32.add
     (local.get $1)
     (i32.const 1048584)
    )
   )
  )
  (local.get $1)
 )
 (func $flush_utf8_logs
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=1048576
   (i32.const 0)
   (local.tee $0
    (i32.rem_u
     (i32.add
      (i32.load offset=1048576
       (i32.const 0)
      )
      (i32.const 1)
     )
     (i32.const 5)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (local.tee $3
      (i32.load
       (local.tee $2
        (i32.add
         (local.tee $1
          (i32.mul
           (local.get $0)
           (i32.const 36)
          )
         )
         (i32.const 1048580)
        )
       )
      )
     )
    )
   )
   (call $report_log
    (i32.add
     (local.get $1)
     (i32.const 1048584)
    )
    (local.get $3)
   )
   (i32.store
    (local.get $2)
    (i32.const 0)
   )
   (local.set $0
    (i32.load offset=1048576
     (i32.const 0)
    )
   )
  )
  (i32.store offset=1048576
   (i32.const 0)
   (local.tee $0
    (i32.rem_u
     (i32.add
      (local.get $0)
      (i32.const 1)
     )
     (i32.const 5)
    )
   )
  )
  (block $label$2
   (br_if $label$2
    (i32.eqz
     (local.tee $2
      (i32.load
       (local.tee $1
        (i32.add
         (i32.mul
          (local.get $0)
          (i32.const 36)
         )
         (i32.const 1048580)
        )
       )
      )
     )
    )
   )
   (call $report_log
    (i32.add
     (i32.mul
      (local.get $0)
      (i32.const 36)
     )
     (i32.const 1048584)
    )
    (local.get $2)
   )
   (i32.store
    (local.get $1)
    (i32.const 0)
   )
   (local.set $0
    (i32.load offset=1048576
     (i32.const 0)
    )
   )
  )
  (i32.store offset=1048576
   (i32.const 0)
   (local.tee $0
    (i32.rem_u
     (i32.add
      (local.get $0)
      (i32.const 1)
     )
     (i32.const 5)
    )
   )
  )
  (block $label$3
   (br_if $label$3
    (i32.eqz
     (local.tee $3
      (i32.load
       (local.tee $2
        (i32.add
         (local.tee $1
          (i32.mul
           (local.get $0)
           (i32.const 36)
          )
         )
         (i32.const 1048580)
        )
       )
      )
     )
    )
   )
   (call $report_log
    (i32.add
     (local.get $1)
     (i32.const 1048584)
    )
    (local.get $3)
   )
   (i32.store
    (local.get $2)
    (i32.const 0)
   )
   (local.set $0
    (i32.load offset=1048576
     (i32.const 0)
    )
   )
  )
  (i32.store offset=1048576
   (i32.const 0)
   (local.tee $0
    (i32.rem_u
     (i32.add
      (local.get $0)
      (i32.const 1)
     )
     (i32.const 5)
    )
   )
  )
  (block $label$4
   (br_if $label$4
    (i32.eqz
     (local.tee $2
      (i32.load
       (local.tee $1
        (i32.add
         (i32.mul
          (local.get $0)
          (i32.const 36)
         )
         (i32.const 1048580)
        )
       )
      )
     )
    )
   )
   (call $report_log
    (i32.add
     (i32.mul
      (local.get $0)
      (i32.const 36)
     )
     (i32.const 1048584)
    )
    (local.get $2)
   )
   (i32.store
    (local.get $1)
    (i32.const 0)
   )
   (local.set $0
    (i32.load offset=1048576
     (i32.const 0)
    )
   )
  )
  (i32.store offset=1048576
   (i32.const 0)
   (local.tee $0
    (i32.rem_u
     (i32.add
      (local.get $0)
      (i32.const 1)
     )
     (i32.const 5)
    )
   )
  )
  (block $label$5
   (br_if $label$5
    (i32.eqz
     (local.tee $2
      (i32.load
       (local.tee $1
        (i32.add
         (local.tee $0
          (i32.mul
           (local.get $0)
           (i32.const 36)
          )
         )
         (i32.const 1048580)
        )
       )
      )
     )
    )
   )
   (call $report_log
    (i32.add
     (local.get $0)
     (i32.const 1048584)
    )
    (local.get $2)
   )
   (i32.store
    (local.get $1)
    (i32.const 0)
   )
  )
 )
 (func $multiply_by_two (param $0 i32) (result i32)
  (i32.shl
   (local.get $0)
   (i32.const 1)
  )
 )
 ;; custom section "producers", size 67
)
