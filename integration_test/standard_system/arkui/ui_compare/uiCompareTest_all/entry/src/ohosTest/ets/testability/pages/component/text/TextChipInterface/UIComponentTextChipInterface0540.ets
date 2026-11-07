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
import { Chip, ChipOptions, ChipSize } from '@kit.ArkUI';

@Entry
@Component
struct UIComponentTextChipInterface0540 {
  @State name: string = 'UIComponentTextChipInterface0540';
  @State message: string = this.name;

  build() {
    Column() {
      Text(this.message)
        .textAlign(TextAlign.Center)
        .margin(10)

      Chip({
        prefixIcon: {
          src: '/images/start.svg',
          fillColor: Color.Brown,
          activatedFillColor: Color.Pink
        },
        label: {
          text: '操作块',
          fontSize: 12,
          fontColor: Color.Blue,
          labelMargin: {
            left: 20,
            right: 30
          }
        },
        suffixIcon: {
          src: '/images/end.svg',
          fillColor: Color.Brown,
          activatedFillColor: Color.Pink,
          size: {
            width: 16,
            height: 16
          },
        },
        size: ChipSize.NORMAL,
        enabled: true,
        onClose: () => {
          console.log('Chip onClose.');
          this.message += '\nChip onClose.';
        },
        onClicked: () => {
          console.log('Chip onClicked.');
          this.message += '\nChip onClicked.';
        }
      })

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
