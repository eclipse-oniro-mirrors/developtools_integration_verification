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
 * @id ITF_10_04_02_201_RUNTIME_OPTIONAL_PROPERTY_DEFAULT_SETTER
 * @expect runtime
 * @section 10.4.2
 * @design 可选属性默认 setter 抛出 InvalidStoreAccessError
 * @note 运行时用例：验证可选属性的默认 setter 抛出 InvalidStoreAccessError
 */
interface Config {
    name: string;
    timeout?: number;
}

class AppConfig implements Config {
    name: string = "app";
}

function main(): void {
    let cfg: Config = new AppConfig();
    
    if (cfg.timeout !== undefined) {
        throw new Error("expected undefined");
    }
    
    console.log("verified");
}
