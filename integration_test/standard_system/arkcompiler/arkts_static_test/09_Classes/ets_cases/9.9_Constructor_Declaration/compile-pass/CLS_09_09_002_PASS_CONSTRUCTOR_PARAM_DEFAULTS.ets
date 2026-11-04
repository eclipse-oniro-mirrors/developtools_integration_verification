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
 * @id CLS_09_09_002_PASS_CONSTRUCTOR_PARAM_DEFAULTS
 * @expect compile-pass
 * @section 9.9
 * @design 构造器参数默认值语法
 * @note 正向用例：构造器参数可含默认值
 */
class Config002 {
  private _host: string
  private _port: int
  constructor(host: string = "localhost", port: int = 8080) {
    this._host = host
    this._port = port
  }
}
class TestConfig002 extends Config002 {
  constructor() {
    super()
  }
}
