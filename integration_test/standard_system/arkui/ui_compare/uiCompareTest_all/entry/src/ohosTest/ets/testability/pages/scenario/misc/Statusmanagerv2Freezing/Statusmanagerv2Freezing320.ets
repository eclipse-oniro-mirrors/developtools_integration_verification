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
@Component
struct LforEachTest70 {
  @State @Watch('onMessageUpdated') message: number = 0;
  onMessageUpdated() {
    console.info(`LazyforEach message callback func ${this.message}`)
  }

  build() {
    Column() {
      Button('go to next page').fontSize(30)
        .onClick(() => {
          router.pushUrl({ url: 'pages/Statusmanagerv2Freezing/Statusmanagerv2Freezing320_copy' })
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

@ObservedV2
class Info {
  @Trace myId: number;   		// 有观测能力
  public name: string;           		// 无观测能力

  constructor(id?: number, name?: string) {
    this.myId = id || 0;
    this.name = name || 'aaa';
  }
}

@Component({ freezeWhenInactive: true })
struct Index {
  info1: Info = new Info();                      // @ObservedV2装饰的Class可以在V1中使用，且被@Trace装饰的类属性具有观测能力
  @Link @Watch('onMessageUpdated') message: number;

  onMessageUpdated() {
    console.info(`FreezeChild message callback func ${this.message}`)
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
