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
 * @id EXP_07_11_04_009_RUNTIME_STATIC_RETURN_VALUE
 * @expect runtime
 * @section 7.11.4
 * @design 验证 static 方法返回值运行时正确性
 * @note 运行时用例：验证 static 方法返回 int 值运行时正确
 */
class Calculator {
  static add(a: int, b: int): int {
    return a + b;
  }
}

function main(): void {
  let result: int = Calculator.add(10, 20);
  if (result != 30) {
    throw new Error('assertion failed: expected 30, got ' + result);
  }
  }
  }
  }
  }
console.log('verified');
}
