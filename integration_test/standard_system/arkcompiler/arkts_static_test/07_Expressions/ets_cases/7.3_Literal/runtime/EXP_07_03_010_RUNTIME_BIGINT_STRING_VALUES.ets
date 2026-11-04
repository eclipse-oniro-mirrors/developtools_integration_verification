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
 * @id EXP_07_03_010_RUNTIME_BIGINT_STRING_VALUES
 * @expect runtime
 * @section 7.3
 * @design 运行时验证 bigint 和字符串字面量的值正确性
 * @note 运行时用例：验证 bigint 字面量和字符串字面量的实际值
 */
function main(): void {
  let bi: bigint = 153n
  if (bi != 153n) throw new Error('bigint value fail: ' + bi)
  let s1: string = 'Hello'
  if (s1 != 'Hello') {
    throw new Error('fail');
  }
  }
  }
  }
  }let s2: string = 'World'
  if (s2 != 'World') {
    throw new Error('fail');
  }
  }
  }
  }
  }let empty: string = ''
  if (empty != '') {
    throw new Error('fail');
  }
  }
  }
  }
  }console.log('verified')
}
