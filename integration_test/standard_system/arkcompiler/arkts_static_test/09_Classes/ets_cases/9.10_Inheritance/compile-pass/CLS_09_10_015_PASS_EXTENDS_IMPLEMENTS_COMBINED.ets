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
 * @id CLS_09_10_015_PASS_EXTENDS_IMPLEMENTS_COMBINED
 * @expect compile-pass
 * @section 9.10
 * @design 类同时使用extends继承父类并使用implements实现接口，合并两边的成员
 * @note 正向用例：子类extends父类+implements接口，方法可来自父类继承或自身实现
 */
interface Logger {
  log(msg: string): void
  getLogs(): string
}

class BaseService {
  protected name: string = "BaseService"

  public getName(): string {
    return this.name
  }

  public start(): string {
    return this.name + " started"
  }
}

class AuthService extends BaseService implements Logger {
  private logData: string = ""

  public log(msg: string): void {
    this.logData = this.logData + msg + ";"
  }

  public getLogs(): string {
    return this.logData
  }

  public authenticate(token: string): boolean {
    this.log("auth " + token)
    return token == "valid"
  }
}

function testExtendsImplements(): void {
  let svc: AuthService = new AuthService()
  let name: string = svc.getName()
  let start: string = svc.start()
  svc.log("test")
  let logs: string = svc.getLogs()
  let ok: boolean = svc.authenticate("valid")
}
