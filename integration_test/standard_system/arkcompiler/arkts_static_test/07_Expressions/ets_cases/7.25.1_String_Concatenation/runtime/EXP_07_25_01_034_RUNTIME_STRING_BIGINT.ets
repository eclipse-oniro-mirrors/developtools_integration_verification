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
 * @id EXP_07_25_01_034_RUNTIME_STRING_BIGINT
 * @expect runtime
 * @section 7.25.1
 * @design 验证 string + bigint 运行时拼接结果正确
 * @note 运行时用例：bigint 在字符串上下文中转为十进制字符串
 */
function main(): void {
    let r1: string = 'big=' + 100n;
    if (r1 != "big=100") {
    throw new Error('assert failed: ' + r1);
  }
  }
  }
  }
    }
    let a: bigint = 12345678901234567890n;
    let r2: string = 'val=' + a;
    if (r2 != "val=12345678901234567890") {
    throw new Error('assert failed: ' + r2);
  }
  }
  }
  }
    }
console.log('verified');
}
