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
 * @id EXP_07_27_03_024_RUNTIME_ASCII_ORDER
 * @expect runtime
 * @section 7.27.3
 * @design 验证ASCII字符顺序的词典序运行时行为
 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
    // 数字 vs 大写字母: '0'(48) < 'A'(65)
    if ('0' < 'A' != true) {
    throw new Error("assertion failed: \'0\' < \"A\'');
  }
  }
  }
  }
    }
    if ('A' > '0' != true) {
    throw new Error("assertion failed: \"A\" > \'0\'");
  }
  }
  }
  }
    }
    if ('9' < 'Z' != true) {
    throw new Error("assertion failed: \'9\' < \"Z\'');
  }
  }
  }
  }
    }

    // 大写字母 vs 小写字母: 'A'(65) < 'a'(97)
    if ('A' < 'a' != true) {
    throw new Error("assertion failed: \"A\" < \"a\'');
  }
  }
  }
  }
    }
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

    // 数字 vs 小写字母: '0'(48) < 'a'(97)
    if ('0' < 'a' != true) {
    throw new Error("assertion failed: \'0\' < \"a\'');
  }
  }
  }
  }
    }
    if ('9' < 'z' != true) {
    throw new Error("assertion failed: \'9\' < \"z\'');
  }
  }
  }
  }
    }

    // 相同范围字符比较
    if ('a' < 'b' != true) {
    throw new Error("assertion failed: \"a\" < \"b\'');
  }
  }
  }
  }
    }
    if ('m' < 'n' != true) {
    throw new Error("assertion failed: \"m\" < \"n\'');
  }
  }
  }
  }
    }
    if ('z' > 'y' != true) {
    throw new Error("assertion failed: \"z\" > \"y\'');
  }
  }
  }
  }
    }

    // 特殊字符: '!'(33) < '0'(48)
    if ('!' < '0' != true) {
    throw new Error("assertion failed: \"!\" < \'0\'");
  }
  }
  }
  }
    }
console.log('verified');
}
