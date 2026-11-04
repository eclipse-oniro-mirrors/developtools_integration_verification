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
 * @id EXP_07_13_03_013_RUNTIME_CASE1_VALID_KEYS
 * @expect runtime
 * @section 7.13.3
 * @design Case 1: 验证字面量联合 Key 的 Record 元素访问运行时值正确性
 * @note 运行时用例：x['key1']、x['key2']、x['key3'] 返回正确值
 */
type Keys = 'key1' | 'key2' | 'key3';

function main(): void {
  let x: Record<Keys, number> = {
    'key1': 1,
    'key2': 2,
    'key3': 4
  };
  let v1: number = x['key1'];
  if (v1 != 1) {
    throw new Error('assertion failed: expected 1, got ' + v1);
  }
  }
  }
  }
  }
  let v2: number = x['key2'];
  if (v2 != 2) {
    throw new Error('assertion failed: expected 2, got ' + v2);
  }
  }
  }
  }
  }
  let v3: number = x['key3'];
  if (v3 != 4) {
    throw new Error('assertion failed: expected 4, got ' + v3);
  }
  }
  }
  }
  }
  // Test write then read
  x['key2'] = 8;
  let v2b: number = x['key2'];
  if (v2b != 8) {
    throw new Error('assertion failed: expected 8, got ' + v2b);
  }
  }
  }
  }
  }
console.log('verified');
}
