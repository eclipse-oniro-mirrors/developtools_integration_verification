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
 * @id EXP_07_20_033_RUNTIME_NULL_LHS
 * @expect runtime
 * @section 7.20
 * @design 验证 null ?? 42 运行时结果为 42。
 *         LHS 为 null（nullish 值），取 RHS。
 * @note 运行时用例：null ?? 42 = 42
 */
function main(): void {
    let result: int = null ?? 42;
    if (result != 42) {
    throw new Error('assertion failed: expected 42, got ' + result);
  }
  }
  }
  }
    }
console.log('verified');
}
