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
import { CounterType, CounterComponent, uiAppearance } from '@kit.ArkUI';

import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIComponentMediaCounterLargeFont002 {
  @State message: string = 'Hello';
  @State arr: number[] = [1, 1.15, 1.3, 1.45, 1.75, 2];
  @State fontScale: string = '1';
  @State index: number = 0;
  private caseName: string = 'SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018';

  build() {
    Column() {
      CounterComponent({
        options: {
          type: CounterType.COMPACT,
          numberOptions: {
            label: '系统字体',
            min: 1,
            value: 1,
            max: 6
          }
        }
      })
      Text(this.fontScale)
        .fontSize(20)
      Row() {
        Button('字体大小：' + this.fontScale)
          .stateEffect(true)
          .id('click')
          .onClick(() => {
            this.index++;
            this.fontScale = this.arr[this.index - 1].toString();
            try {
              uiAppearance.setFontScale(this.arr[this.index - 1]).then(() => {
                console.info(`${this.caseName} Set fontScale successfully.`);
              }).catch((error:Error) => {
                console.error(`${this.caseName} Set fontScale failed, message is ${error.message}` );
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error(`${this.caseName} Set fontScale failed, messages: ${message}`);
            }
          })
      }
    }
    .width('100%')
  }
}