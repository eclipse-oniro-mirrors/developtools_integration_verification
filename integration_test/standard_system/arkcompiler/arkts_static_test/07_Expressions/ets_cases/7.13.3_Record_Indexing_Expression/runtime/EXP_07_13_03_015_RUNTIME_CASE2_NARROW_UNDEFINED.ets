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
 * @id EXP_07_13_03_015_RUNTIME_CASE2_NARROW_UNDEFINED
 * @expect runtime
 * @section 7.13.3
 * @design Case 2: 验证 undefined 检查后类型收窄和安全断言的使用
 * @note 运行时用例：检查 undefined 后使用 as 断言
 */
function main(): void {
  let x: Record<number, string> = {
    1: 'hello',
    2: 'bye'
  };
  // 存在的键
  let n1: number = 2;
  let s1: string | undefined = x[n1];
  let r1: string;
  if (s1 == undefined) {
    r1 = 'no';
  } else {
    r1 = s1 as string;}
  if (r1 != 'bye') {
    throw new Error('assertion failed: expected bye, got ' + r1);
  }
  }
  }
  }
  }
  // 不存在的键
  let n2: number = 5;
  let s2: string | undefined = x[n2];
  let r2: string;
  if (s2 == undefined) {
    r2 = 'no';
  } else {
    r2 = s2 as string;}
  if (r2 != 'no') {
    throw new Error('assertion failed: expected no, got ' + r2);
  }
  }
  }
  }
  }
console.log('verified');
}
