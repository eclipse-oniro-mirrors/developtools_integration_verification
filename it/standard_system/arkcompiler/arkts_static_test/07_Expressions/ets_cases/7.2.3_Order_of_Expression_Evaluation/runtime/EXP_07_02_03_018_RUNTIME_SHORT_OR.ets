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
 * @id EXP_07_02_03_018_RUNTIME_SHORT_OR
 * @expect runtime
 * @section 7.2.3
 * @design 验证 || 短路求值：左为 true 时跳过右操作数
 * @note 运行时用例：验证该场景的运行时行为
 */
let trace: string = '';

function track(s: string): boolean {
  trace += s;
  return s == 'true';
}

function main(): void {
  trace = '';
  let a: boolean = track('false') || track('R');
  if (trace != 'falseR') {
    throw new Error('or false path fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let b: boolean = track('true') || track('skip');
  if (trace != 'true') {
    throw new Error('or true short-circuit fail: ' + trace);
  }
  }
  }
  }
  }

  trace = '';
  let c: boolean = track('true') || track('x') || track('y');
  if (trace != 'true') {
    throw new Error('or chained short-circuit fail: ' + trace);
  }
  }
  }
  }
  }
console.log('verified');
}
