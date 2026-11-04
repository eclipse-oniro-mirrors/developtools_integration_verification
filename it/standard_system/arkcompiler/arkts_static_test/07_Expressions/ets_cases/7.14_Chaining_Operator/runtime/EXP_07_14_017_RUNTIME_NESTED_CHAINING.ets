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
 * @id EXP_07_14_017_RUNTIME_NESTED_CHAINING
 * @expect runtime
 * @section 7.14
 * @design 验证多层嵌套链式操作符运行时：不同层级 nullish 时返回 undefined
 * @note 运行时用例：o?.middle?.inner?.value 当某一层为 undefined 时返回 undefined
 */
class Inner {
  public value: int = 42;
}

class Middle {
  inner?: Inner = undefined;
}

class Outer {
  middle?: Middle = undefined;
}

function main(): void {
  // Case 1: 全部非 nullish → 返回值
  let o1: Outer = new Outer();
  let m1: Middle = new Middle();
  m1.inner = new Inner();
  o1.middle = m1;
  let v1: int | undefined = o1?.middle?.inner?.value;
  if (v1 != 42) {
    throw new Error('assertion failed: expected 42, got ' + v1);
  }
  }
  }
  }
  }

  // Case 2: middle 为 undefined → 返回 undefined
  let o2: Outer = new Outer();
  let v2: int | undefined = o2?.middle?.inner?.value;
  if (v2 != undefined) {
    throw new Error('assertion failed: expected undefined, got ' + v2);
  }
  }
  }
  }
  }
console.log('verified');
}
