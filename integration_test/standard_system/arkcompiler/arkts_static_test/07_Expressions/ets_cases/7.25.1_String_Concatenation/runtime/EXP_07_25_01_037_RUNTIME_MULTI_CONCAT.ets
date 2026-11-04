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
 * @id EXP_07_25_01_037_RUNTIME_MULTI_CONCAT
 * @expect runtime
 * @section 7.25.1
 * @design 验证多字符串连续拼接结果正确且字符串按顺序拼接
 * @note 运行时用例：多个字符串连续拼接结果 = LHS+...+RHS
 */
function main(): void {
    let r1: string = 'A' + 'B' + 'C' + 'D';
    if (r1 != 'ABCD') {
    throw new Error('assert 'A'+'B'+'C'+'D' failed: ' + r1);
  }
  }
  }
  }
    }
    let a: string = 'Hello';
    let b: string = ' ';
    let c: string = 'World';
    let r2: string = a + b + c;
    if (r2 != 'Hello World') {
    throw new Error('assert a+b+c failed: ' + r2);
  }
  }
  }
  }
    }
console.log('verified');
}
