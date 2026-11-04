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
 * @id EXP_07_27_03_023_RUNTIME_CASE_SENSITIVITY
 * @expect runtime
 * @section 7.27.3
 * @design 验证字符串大小写敏感的词典序运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    let hello: string = 'Hello';
    let helloLow: string = 'hello';

    // 'H'(72) < 'h'(104)，所以 "Hello" < "hello"
    if (hello < helloLow != true) {
    throw new Error("assertion failed: \"Hello\" < \"hello\'');
  }
  }
  }
  }
    }
    if (helloLow > hello != true) {
    throw new Error("assertion failed: \"hello\" > \"Hello\'');
  }
  }
  }
  }
    }
    if (hello <= helloLow != true) {
    throw new Error("assertion failed: \"Hello\" <= \"hello\'');
  }
  }
  }
  }
    }
    if (hello >= helloLow != false) {
    throw new Error("assertion failed: \"Hello\" >= \"hello\'');
  }
  }
  }
  }
    }

    // "ABC" vs "abc": 'A'(65) < 'a'(97)
    if ('ABC' < 'abc' != true) {
    throw new Error("assertion failed: \"ABC\" < \"abc\'');
  }
  }
  }
  }
    }
    if ('abc' > 'ABC' != true) {
    throw new Error("assertion failed: \"abc\" > \"ABC\'');
  }
  }
  }
  }
    }

    // "apple" vs "Apple": 'a'(97) > 'A'(65)
    if ('apple' > 'Apple' != true) {
    throw new Error("assertion failed: \"apple\" > \"Apple\'');
  }
  }
  }
  }
    }
    if ('Apple' < 'apple' != true) {
    throw new Error("assertion failed: \"Apple\" < \"apple\'');
  }
  }
  }
  }
    }

    // "Z" vs "a": 'Z'(90) < 'a'(97)
    if ('Z' < 'a' != true) {
    throw new Error("assertion failed: \"Z\" < \"a\'');
  }
  }
  }
  }
    }
    if ('a' > 'Z' != true) {
    throw new Error("assertion failed: \"a\" > \"Z\'');
  }
  }
  }
  }
    }
console.log('verified');
}
