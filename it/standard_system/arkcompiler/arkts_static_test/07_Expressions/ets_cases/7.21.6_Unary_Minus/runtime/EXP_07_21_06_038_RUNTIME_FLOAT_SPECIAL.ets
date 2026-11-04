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
 * @id EXP_07_21_06_038_RUNTIME_FLOAT_SPECIAL
 * @expect runtime
 * @section 7.21.6
 * @design 验证浮点特殊值的求反行为。
 *         spec: -NaN=NaN, -infinity=-infinity, -0.0=+0.0。
 * @note 运行时用例：浮点特殊值求反
 */
function main(): void {
    // -0.0 → 0.0
    let nz: double = -0.0;
    let r1: double = -nz;
    if (r1 != 0.0) {
    throw new Error('assertion failed: expected -(-0.0)=0.0, got ' + r1);
  }
  }
  }
  }
    }
    // 负无穷 → 正无穷
    let ninf: double = -1.0 / 0.0;
    let r2: double = -ninf;
    if (r2 != 1.0 / 0.0) {
    throw new Error('assertion failed: expected -(-inf)=inf, got ' + r2);
  }
  }
  }
  }
    }
    // NaN 求反仍为 NaN
    let nan: double = 0.0 / 0.0;
    let r3: double = -nan;
    if (r3 == r3) {
        // NaN != NaN，所以如果相等则说明不是 NaN
        throw new Error('assertion failed: expected -NaN=NaN');
    }
console.log('verified');
}
