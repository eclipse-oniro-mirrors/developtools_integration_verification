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
 * @id EXP_07_33_018_RUNTIME_NESTED_TERNARY
 * @expect runtime
 * @section 7.33
 * @design 验证三元条件表达式的右结合性运行时行为：a?b:c?d:e 等价于 a?b:(c?d:e)；多层嵌套的正确求值
 * @note 运行时用例：嵌套三元表达式的右结合性运行时验证
 */
function main(): void {
  // 双层嵌套：a?b:c?d:e → a 为 true 时返回 b
  let r1: int = true ? 1 : false ? 2 : 3;
  if (r1 != 1) {
    throw new Error('assertion failed: true?1:false?2:3 expected 1, got ' + r1);
  }
  }
  }
  }
  }

  // 双层嵌套：a?b:c?d:e → a 为 false 时进入内部三元
  let r2: int = false ? 1 : true ? 2 : 3;
  if (r2 != 2) {
    throw new Error('assertion failed: false?1:true?2:3 expected 2, got ' + r2);
  }
  }
  }
  }
  }

  // 双层嵌套：a?b:c?d:e → a 为 false，c 为 false
  let r3: int = false ? 1 : false ? 2 : 3;
  if (r3 != 3) {
    throw new Error('assertion failed: false?1:false?2:3 expected 3, got ' + r3);
  }
  }
  }
  }
  }

  // 三层嵌套：a?b:c?d:e?f:g
  // true → 选 1
  let r4: int = true ? 1 : false ? 2 : true ? 3 : 4;
  if (r4 != 1) {
    throw new Error('assertion failed: true?1:false?2:true?3:4 expected 1, got ' + r4);
  }
  }
  }
  }
  }

  // false → 进入 false?2:true?3:4 → false → 进入 true?3:4 → true → 选 3
  let r5: int = false ? 1 : false ? 2 : true ? 3 : 4;
  if (r5 != 3) {
    throw new Error('assertion failed: false?1:false?2:true?3:4 expected 3, got ' + r5);
  }
  }
  }
  }
  }

  // 全部 false → 选 4
  let r6: int = false ? 1 : false ? 2 : false ? 3 : 4;
  if (r6 != 4) {
    throw new Error('assertion failed: false?1:false?2:false?3:4 expected 4, got ' + r6);
  }
  }
  }
  }
  }
console.log('verified');
}
