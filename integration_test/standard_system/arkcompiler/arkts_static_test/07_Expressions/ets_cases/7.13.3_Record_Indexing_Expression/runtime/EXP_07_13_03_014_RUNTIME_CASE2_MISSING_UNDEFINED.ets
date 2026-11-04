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
 * @id EXP_07_13_03_014_RUNTIME_CASE2_MISSING_UNDEFINED
 * @expect runtime
 * @section 7.13.3
 * @design Case 2: 验证非字面量 Key 的 Record 索引缺失时返回 undefined
 * @note 运行时用例：Record<number, string> 中 x[3] 不存在，返回 undefined
 */
function main(): void {
  let x: Record<number, string> = {
    1: 'hello',
    2: 'bye'
  };
  let s: string | undefined = x[1];
  if (s != 'hello') {
    throw new Error('assertion failed: expected hello, got ' + s);
  }
  }
  }
  }
  }
  let s2: string | undefined = x[3];
  if (s2 != undefined) {
    throw new Error('assertion failed: expected undefined, got ' + s2);
  }
  }
  }
  }
  }
console.log('verified');
}
