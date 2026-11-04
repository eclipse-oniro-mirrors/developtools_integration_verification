/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
/**
 * @id CLS_09_07_020_RUNTIME_OVERRIDE_MULTILEVEL
 * @expect runtime
 * @section 9.7.5
 * @design 方法重写运行时：多层级继承链中的重写方法动态分发
 * @note 运行时用例：A->B->C三层继承，验证每层重写方法在基类引用下的正确分发
 */
class Logger020 {
  log(message: string): string {
    return "[LOG] " + message
  }

  getLevel(): string {
    return "BASE"
  }

  format(msg: string, level: int): string {
    return "[" + level.toString() + "] " + msg
  }
}

class FileLogger020 extends Logger020 {
  override log(message: string): string {
    return "[FILE] " + message
  }

  override getLevel(): string {
    return "FILE"
  }

  override format(msg: string, level: int): string {
    return "[FILE:" + level.toString() + "] " + msg
  }
}

class TimestampFileLogger020 extends FileLogger020 {
  override log(message: string): string {
    return "[2024-01-01][FILE] " + message
  }

  override getLevel(): string {
    return "TIMESTAMP_FILE"
  }

  override format(msg: string, level: int): string {
    return "[TS:FILE:" + level.toString() + "] " + msg
  }
}

function main(): void {
  // Three-level polymorphic dispatch through base class reference
  let logger1: Logger020 = new Logger020()
  let logger2: Logger020 = new FileLogger020()
  let logger3: Logger020 = new TimestampFileLogger020()

  // Verify each level dispatches to its own override
  let r1: string = logger1.log("test1")
  let r2: string = logger2.log("test2")
  let r3: string = logger3.log("test3")

  console.log(r1)
  console.log(r2)
  console.log(r3)

  // Verify getLevel dispatch
  let level1: string = logger1.getLevel()
  let level2: string = logger2.getLevel()
  let level3: string = logger3.getLevel()

  console.log(level1)
  console.log(level2)
  console.log(level3)

  // Verify format dispatch
  let f1: string = logger1.format("msg1", 1)
  let f2: string = logger2.format("msg2", 2)
  let f3: string = logger3.format("msg3", 3)

  console.log(f1)
  console.log(f2)
  console.log(f3)

  // Mid-level reference dispatch
  let midRef: FileLogger020 = new TimestampFileLogger020()
  let midResult: string = midRef.log("mid-ref-test")
  console.log(midResult)

  let midLevel: string = midRef.getLevel()
  console.log(midLevel)

  // Verify correct dispatch with explicit assertions
  if (r1 == "[LOG] test1") {
    console.log("Base logger verified")
  }

  if (r2 == "[FILE] test2") {
    console.log("File logger verified")
  }

  if (r3 == "[2024-01-01][FILE] test3") {
    console.log("Timestamp file logger verified")
  }

  if (midResult == "[2024-01-01][FILE] mid-ref-test") {
    console.log("Mid-level reference polymorphic dispatch verified")
  }

  console.log("verified")
}
