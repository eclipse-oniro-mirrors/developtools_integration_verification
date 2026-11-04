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
 * @id EXP_07_27_03_027_RUNTIME_LONG_STRINGS
 * @expect runtime
 * @section 7.27.3
 * @design 验证长字符串的词典序运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    // 长字符串比较（中间字符不同）
    let long1: string = 'abcdefghijklmnopqrstuvwxyz';
    let long2: string = 'abcdefghijklmnopqrstuvwxyZ';

    // long1 最后字符 'z'(122) > long2 最后字符 'Z'(90)
    if (long1 > long2 != true) {
    throw new Error('assertion failed: long1 > long2 (z > Z)');
  }
  }
  }
  }
    }
    if (long2 < long1 != true) {
    throw new Error('assertion failed: long2 < long1');
  }
  }
  }
  }
    }

    // 非常相似的超长字符串
    let s1: string = 'The quick brown fox jumps over the lazy dog';
    let s2: string = 'The quick brown fox jumps over the lazy cat';

    // "dog" > "cat" at the end
    if (s1 > s2 != true) {
    throw new Error('assertion failed: dog > cat');
  }
  }
  }
  }
    }
    if (s2 < s1 != true) {
    throw new Error('assertion failed: cat < dog');
  }
  }
  }
  }
    }

    // 相同长字符串
    let t1: string = 'ARKTS is a static typed programming language for software development';
    let t2: string = 'ARKTS is a static typed programming language for software development';
    if (t1 < t2 != false) {
    throw new Error('assertion failed: t1 < t2 (equal)');
  }
  }
  }
  }
    }
    if (t1 <= t2 != true) {
    throw new Error('assertion failed: t1 <= t2 (equal)');
  }
  }
  }
  }
    }
    if (t1 > t2 != false) {
    throw new Error('assertion failed: t1 > t2 (equal)');
  }
  }
  }
  }
    }
    if (t1 >= t2 != true) {
    throw new Error('assertion failed: t1 >= t2 (equal)');
  }
  }
  }
  }
    }

    // 数字前缀的字符串
    if ("version 2.0' > 'version 10.0" != true) {
    throw new Error('assertion failed: version 2.0 > version 10.0 (lexicographic)');
  }
  }
  }
  }
    }
console.log('verified');
}
