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
 * @id EXP_07_21_06_035_RUNTIME_LONG_VALUE
 * @expect runtime
 * @section 7.21.6
 * @design 验证 -long 运行时值正确。long 保持 long。
 * @note 运行时用例：-long 求反值正确
 */
function main(): void {
    let x: long = 10000000000;
    let r: long = -x;
    if (r != -10000000000) {
    throw new Error('assertion failed: expected -10000000000, got ' + r);
  }
  }
  }
  }
    }
    let y: long = -10000000000;
    let r2: long = -y;
    if (r2 != 10000000000) {
    throw new Error('assertion failed: expected -(-10000000000)=10000000000, got ' + r2);
  }
  }
  }
  }
    }
console.log('verified');
}
