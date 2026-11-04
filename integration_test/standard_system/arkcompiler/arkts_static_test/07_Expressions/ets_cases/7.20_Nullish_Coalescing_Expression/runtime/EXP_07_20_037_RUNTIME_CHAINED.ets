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
 * @id EXP_07_20_037_RUNTIME_CHAINED
 * @expect runtime
 * @section 7.20
 * @design 验证 undefined ?? null ?? "last" 链式 ?? 运行时结果为 "last"。
 *         左结合：先 undefined ?? null → null，再 null ?? "last" → "last"。
 * @note 运行时用例：链式 ?? = "last"
 */
function main(): void {
    let result: string = undefined ?? null ?? 'last';
    if (result != 'last') {
    throw new Error('assertion failed: expected 'last', got ' + result);
  }
  }
  }
  }
    }
console.log('verified');
}
