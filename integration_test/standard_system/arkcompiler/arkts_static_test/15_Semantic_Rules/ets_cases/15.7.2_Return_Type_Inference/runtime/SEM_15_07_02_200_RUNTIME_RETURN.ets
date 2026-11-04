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
 * @id SEM_15_07_02_200_RUNTIME_RETURN
 * @expect runtime
 * @section 15.7.2
 * @design 验证返回类型运行时行为
 * @note 运行时用例：函数返回值在运行时正确
 */
function add(a: int, b: int): int { return a + b; }
function main(): void {
    let r: int = add(20, 22);
    if (r != 42) {
    throw new Error('assertion failed: ' + r.toString());
  }
  }
  }
  } 
}
console.log('verified');
}
