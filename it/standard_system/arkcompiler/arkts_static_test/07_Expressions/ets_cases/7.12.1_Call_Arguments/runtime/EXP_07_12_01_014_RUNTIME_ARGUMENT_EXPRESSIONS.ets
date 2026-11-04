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
 * @id EXP_07_12_01_014_RUNTIME_ARGUMENT_EXPRESSIONS
 * @expect runtime
 * @section 7.12.1
 * @design 验证表达式作为参数运行时正确求值
 * @note 运行时用例：参数为复合表达式和函数调用时的运行时求值
 */
function process(x: int, y: int): int {
  return x + y;
}

function getValue(): int {
  return 50;
}

function main(): void {
  let r: int = process(30 + 20, getValue());
  if (r != 100) {
    throw new Error('assertion failed: expected 100, got ' + r);
  }
  }
  }
  }
  }

  let r2: int = process(2 * 15, 100 / 2);
  if (r2 != 80) {
    throw new Error('assertion failed: expected 80, got ' + r2);
  }
  }
  }
  }
  }
console.log('verified');
}
