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
 * @id EXP_07_21_06_034_RUNTIME_BYTE_WIDEN
 * @expect runtime
 * @section 7.21.6
 * @design 验证 -byte 运行时值正确，结果拓宽为 int。
 *         -byte(10)=-10(int), -byte(-128)=128(int)。
 * @note 运行时用例：-byte → int 拓宽求反
 */
function main(): void {
    let a: byte = 10;
    let r1: int = -a;
    if (r1 != -10) {
    throw new Error('assertion failed: expected -byte(10)=-10, got ' + r1);
  }
  }
  }
  }
    }
    let b: byte = -128;
    let r2: int = -b;
    if (r2 != 128) {
    throw new Error('assertion failed: expected -byte(-128)=128, got ' + r2);
  }
  }
  }
  }
    }
console.log('verified');
}
