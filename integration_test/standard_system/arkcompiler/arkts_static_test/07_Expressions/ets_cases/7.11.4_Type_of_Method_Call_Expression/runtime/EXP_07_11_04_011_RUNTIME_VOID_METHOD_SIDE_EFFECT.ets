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
 * @id EXP_07_11_04_011_RUNTIME_VOID_METHOD_SIDE_EFFECT
 * @expect runtime
 * @section 7.11.4
 * @design 验证 void 方法作为语句调用时副作用生效
 * @note 运行时用例：void 方法作为语句调用，验证其副作用（字段修改）正确生效
 */
class Counter {
  public count: int = 0;

  increment(): void {
    this.count = this.count + 1;
  }

  getCount(): int {
    return this.count;
  }
}

function main(): void {
  let c: Counter = new Counter();
  c.increment();
  c.increment();
  c.increment();
  let val: int = c.getCount();
  if (val != 3) {
    throw new Error('assertion failed: expected 3, got ' + val);
  }
  }
  }
  }
  }
console.log('verified');
}
