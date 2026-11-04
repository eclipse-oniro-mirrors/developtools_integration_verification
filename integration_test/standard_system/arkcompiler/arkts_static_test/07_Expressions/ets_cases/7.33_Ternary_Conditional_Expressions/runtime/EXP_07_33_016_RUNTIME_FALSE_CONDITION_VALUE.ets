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
 * @id EXP_07_33_016_RUNTIME_FALSE_CONDITION_VALUE
 * @expect runtime
 * @section 7.33
 * @design 验证三元条件表达式当 condition=false 时：选择 whenFalse 分支求值，返回 whenFalse 的值，whenTrue 不执行
 * @note 运行时用例：condition=false 时验证返回值正确性
 */
function main(): void {
  // condition=false → 返回 whenFalse 的值
  let r1: int = false ? 42 : 99;
  if (r1 != 99) {
    throw new Error('assertion failed: false ? 42 : 99 expected 99, got ' + r1);
  }
  }
  }
  }
  }

  // condition=false，whenFalse 为字符串
  let r2: string = false ? 'hello' : 'world';
  if (r2 != 'world') {
    throw new Error('assertion failed: false ? 'hello' : 'world' expected world, got ' + r2);
  }
  }
  }
  }
  }

  // condition=false，whenFalse 为浮点数（float literal）
  let r3: float = false ? 3.14f : 2.71f;
  if (r3 != 2.71f) {
    throw new Error('assertion failed: false ? 3.14f : 2.71f expected 2.71, got ' + r3);
  }
  }
  }
  }
  }
console.log('verified');
}
