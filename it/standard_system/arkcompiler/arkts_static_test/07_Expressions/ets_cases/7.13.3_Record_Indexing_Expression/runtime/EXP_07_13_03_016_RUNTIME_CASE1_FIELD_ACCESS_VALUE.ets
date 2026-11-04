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
 * @id EXP_07_13_03_016_RUNTIME_CASE1_FIELD_ACCESS_VALUE
 * @expect runtime
 * @section 7.13.3
 * @design Case 1: 验证方括号索引的值正确性和写入后读取一致性
 * @note 运行时用例：使用方括号索引进行读写验证
 * ⚠️ SPEC 不一致：编译器不支持 Record 上的字段访问符号 .key2
 *     （见 EXP_07_13_03_003_PASS_CASE1_FIELD_ACCESS），此处仅验证方括号索引
 */
type Keys = 'key1' | 'key2' | 'key3';

function main(): void {
  let x: Record<Keys, number> = {
    'key1': 1,
    'key2': 2,
    'key3': 4
  };
  let v1: number = x['key2'];
  if (v1 != 2) {
    throw new Error('assertion failed: expected 2, got ' + v1);
  }
  }
  }
  }
  }
  // Write via bracket notation
  x['key1'] = 99;
  let v2: number = x['key1'];
  if (v2 != 99) {
    throw new Error('assertion failed: expected 99, got ' + v2);
  }
  }
  }
  }
  }
console.log('verified');
}
