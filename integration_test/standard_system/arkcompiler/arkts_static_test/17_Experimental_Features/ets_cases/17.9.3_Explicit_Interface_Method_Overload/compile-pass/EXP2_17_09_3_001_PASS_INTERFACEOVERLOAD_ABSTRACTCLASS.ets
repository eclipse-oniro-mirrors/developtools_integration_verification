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
 * @id EXP2_17_09_3_001_PASS_INTERFACEOVERLOAD_ABSTRACTCLASS
 * @expect compile-pass
 * @section 17.9.3
 * @design 抽象类实现接口但声明为 abstract，不实现方法
 * @note 正向用例：抽象类可以声明 abstract 方法匹配接口 overload
 */
interface IWorker {
  workInt(a: int): string
  workStr(a: string): string
  overload work { workInt, workStr }
}

abstract class AbstractWorker implements IWorker {
  // 抽象方法，留给子类实现
  abstract workInt(a: int): string
  abstract workStr(a: string): string
}

class ConcreteWorker extends AbstractWorker {
  workInt(a: int): string { return 'int:' + a }
  workStr(a: string): string { return 'str:' + a }
  overload work { workInt, workStr }
}
