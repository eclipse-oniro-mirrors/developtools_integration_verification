/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { router } from '@kit.ArkUI';
@Entry
@ComponentV2
struct LforEachTest70 {
  @Local message: number = 0;

  @Monitor('message') info() {
    console.info(`freeze-test MyNavigation message callback ${this.message}`);
  }

  build() {
    Column() {
      Button('go to next page').fontSize(30)
        .onClick(() => {
          router.back()
        })
        .id('test')
      Button('change message').onClick(() => {
        this.message++
      }).id('button')
      Tabs() {
        TabContent() {
          Index({ message: this.message })
        }
      }
    }
  }
}

@Observed
class Info {
  @Track myId: number;   		  // 无观测能力，只能防止因其他属性改变而导致的连带刷新
  public name: string;           		  // 无观测能力
  constructor(id?: number, name?: string) {
    this.myId = id || 0;
    this.name = name || 'aaa';
  }
}

@ComponentV2
struct Index {
  info1: Info = new Info();             // @Observed装饰的Class可以在V2中使用
  @Param message: number = 0;

  @Monitor('message') onMessageUpdated(mon: IMonitor) {
    console.info(`FreezeChild message callback func ${this.message}`);
  }
  build() {
    Column() {
      Text(`${this.message}`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .height('100%')
    .width('100%')
    .margin(5)
  }
}

