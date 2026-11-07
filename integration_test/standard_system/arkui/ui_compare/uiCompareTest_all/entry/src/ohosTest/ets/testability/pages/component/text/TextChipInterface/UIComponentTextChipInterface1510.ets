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
struct UIComponentTextChipInterface1510 {
  @State name: string = 'UIComponentTextChipInterface1510';
  @State message: string = this.name + ' message:';
  @State isActivated: boolean = false;
  @State iconSize: SizeOptions = {
    width: 16,
    height: 16
  };
  @State chipSize: SizeOptions = {
    width: 200,
    height: 50
  };
  @State fontSize: Dimension = 12;
  switched: boolean = false;

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Pink)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(100)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Chip({
        prefixIcon: {
          src: '/images/start.svg',
          fillColor: Color.Brown,
          activatedFillColor: Color.Pink,
          size: this.iconSize,
        },
        label: {
          text: '操作块',
          fontSize: this.fontSize,
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
          size: this.iconSize,
        },
        size: this.chipSize,
        activated: this.isActivated,
        backgroundColor: '#F7F7F7',
        borderRadius: $r('sys.float.ohos_id_corner_radius_button'),
        activatedBackgroundColor: '#007DFF',
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

      Button('switch size')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(() => {
          if (this.switched) {
            this.chipSize = {
              width: 200,
              height: 50
            };
            this.iconSize = {
              width: 16,
              height: 16
            };
            this.fontSize = 12;
            this.switched = false;
            this.message += `\nChip size switched to normal. chipSize: ${JSON.stringify(this.chipSize)}, iconSize: ${JSON.stringify(this.iconSize)}, fontSize: ${this.fontSize}}`;
          } else {
            this.chipSize = {
              width: 150,
              height: 30
            };
            this.iconSize = {
              width: 32,
              height: 32
            };
            this.fontSize = 16;
            this.switched = true;
            this.message += `\nChip size switched. chipSize: ${JSON.stringify(this.chipSize)}, iconSize: ${JSON.stringify(this.iconSize)}, fontSize: ${this.fontSize}}`;
          }
        })

      Scroll() {
        Text(this.message)
          .fontSize(10)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Medium)
          .fontStyle(FontStyle.Normal)
          .textAlign(TextAlign.Center)
          .width('100%')
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
      }
      .id(this.name + '_02')
      .friction(0.6)
      .backgroundColor(Color.Yellow)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('16.39%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}

