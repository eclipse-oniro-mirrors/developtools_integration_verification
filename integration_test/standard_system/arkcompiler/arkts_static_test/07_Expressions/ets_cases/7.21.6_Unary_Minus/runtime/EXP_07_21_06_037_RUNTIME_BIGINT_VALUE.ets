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
 * @id EXP_07_21_06_037_RUNTIME_BIGINT_VALUE
 * @expect runtime
 * @section 7.21.6
 * @design 验证 -bigint 运行时值正确。
 *         spec: -bigint 等价于 0n - bigint。
 * @note 运行时用例：-bigint 求反值正确
 */
function main(): void {
    let x: bigint = 1n;
    let r: bigint = -x;
    if (r != -1n) {
    throw new Error('assertion failed: expected -1n=-1n, got ' + r);
  }
  }
  }
  }
    }
    let y: bigint = -1n;
    let r2: bigint = -y;
    if (r2 != 1n) {
    throw new Error('assertion failed: expected -(-1n)=1n, got ' + r2);
  }
  }
  }
  }
    }
console.log('verified');
}
