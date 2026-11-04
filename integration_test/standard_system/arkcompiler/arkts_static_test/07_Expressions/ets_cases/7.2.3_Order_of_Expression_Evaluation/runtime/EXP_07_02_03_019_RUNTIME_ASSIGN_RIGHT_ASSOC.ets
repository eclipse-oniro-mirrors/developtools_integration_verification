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
 * @id EXP_07_02_03_019_RUNTIME_ASSIGN_RIGHT_ASSOC
 * @expect runtime
 * @section 7.2.3
 * @design 验证赋值右结合求值顺序：子表达式从左到右求值，赋值从右到左
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

class A {
  public tag: string;
  constructor(s: string) {
    this.tag = s;
  }
}

function f(s: string): A {
  trace += s;
  return new A(s);
}

function main(): void {
  trace = '';
  let result: string = f('left').tag = f('mid').tag = f('right').tag;
  // Evaluation order: f("left"), f("mid"), f("right") → left-to-right
  // Assignment order: right → mid.tag, then result → left.tag → right-to-left
  if (trace != 'leftmidright') {
    throw new Error('assign eval order fail: ' + trace);
  }
  }
  }
  }
  }
  // All tags should be "right" (value propagates right-to-left)
  let a: A = f('x');  // for trace
  if (result != 'right') {
    throw new Error('assign result value fail: ' + result);
  }
  }
  }
  }
  }
console.log('verified');
}
