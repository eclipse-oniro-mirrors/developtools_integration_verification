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
 * @id CLS_09_07_015_PASS_OVERRIDE_DIFFERENT_DEFAULT
 * @expect compile-pass
 * @section 9.7.5
 * @design 重写违规：重写方法使用与原方法不同的默认参数值
 * @note 反向用例：override方法必须保持与超类方法相同的默认参数值
 */
class Printer015 {
  print(text: string = "Hello"): string {
    return text
  }

  format(prefix: string = "[INFO]", suffix: string = ""): string {
    return prefix + "message" + suffix
  }
}

class CustomPrinter015 extends Printer015 {
  // Error: overriding method changes default parameter value (default changed from "Hello" to "World")
  override print(text: string = "World"): string {
    return "Custom: " + text
  }

  // Error: overriding method changes one of the default parameter values
  // (prefix default changed from "[INFO]" to "[CUSTOM]")
  override format(prefix: string = "[CUSTOM]", suffix: string = ""): string {
    return prefix + "custom message" + suffix
  }
}
