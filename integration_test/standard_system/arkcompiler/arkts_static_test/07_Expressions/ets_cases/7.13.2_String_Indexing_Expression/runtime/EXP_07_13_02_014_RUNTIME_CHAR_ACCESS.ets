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
 * @id EXP_07_13_02_014_RUNTIME_CHAR_ACCESS
 * @expect runtime
 * @section 7.13.2
 * @design 验证字符串索引元素访问运行时正确性：索引访问返回 string 类型字符
 * @note 运行时用例：验证字符串索引访问结果正确性（首、中、尾字符）
 */
function main(): void {
  let s: string = 'arkts';
  let c0: string = s[0];
  if (c0 != 'a') {
    throw new Error('assertion failed: expected a, got ' + c0);
  }
  }
  }
  }
  }
  let c2: string = s[2];
  if (c2 != 'k') {
    throw new Error('assertion failed: expected k, got ' + c2);
  }
  }
  }
  }
  }
  let c4: string = s[4];
  if (c4 != 's') {
    throw new Error('assertion failed: expected s, got ' + c4);
  }
  }
  }
  }
  }
console.log('verified');
}
