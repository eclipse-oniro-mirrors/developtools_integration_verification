/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct StatusManagerV2LazyForEachBetter003 {
  @State data: string[] = [];
  aboutToAppear() {
    for (let i = 1; i < 1000; i++) {
      this.data.push(i+ '');
    }
  }

  async routePage() {
    this.getUIContext().getRouter().pushUrl({
      url: 'testability/pages/scenario/concurrency/StatusManagerV2LazyForEachBetter/StatusManagerV2LazyForEachBetter004',
    })
      .then(() => {
        console.info('StatusManagerV2LazyForEachBetter004 succeeded');
      })
      .catch((error: BusinessError) => {
        console.error(`StatusManagerV2LazyForEachBetter004 pushUrl failed, error is ${JSON.stringify(error)}.`);
      })
  }

  build() {
    Column() {
      Text('无复用组件')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .height('10%')
      List() {
        ForEach(this.data, (item: string) => {
          ListItem() {
            Column() {
              Text(item)
                .fontSize(30)
            }
            .borderWidth(1)
            .height('8.2%')
            .width('55.56%')
          }
        }, (item: string) => item)
      }
      .cachedCount(4)
      .height('75%')
      Button('组件复用')
        .id('reusable')
        .stateEffect(true)
        .onClick(() => {
          this.routePage();
        })
        .height('5%')
    }
  }
}
