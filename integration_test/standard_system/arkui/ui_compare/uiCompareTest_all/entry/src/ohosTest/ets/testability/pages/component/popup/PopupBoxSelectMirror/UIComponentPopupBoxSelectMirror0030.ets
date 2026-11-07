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

@Entry
@Component
struct UIComponentPopupBoxSelectMirror0030 {
  @State name: string = 'UIComponentPopupBoxSelectMirror0030';
  @State message: string = this.name;
  @State text: string = 'Select';
  @State index: number = 2;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Row() {

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_01')
          .selected(this.index)
          .value(this.text + '1')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 1 onFocus.'
          })

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_02')
          .selected(this.index)
          .value(this.text + '2')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 2 onFocus.'
          })

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_03')
          .selected(this.index)
          .value(this.text + '3')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 3 onFocus.'
          })

      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .height('16.39%')
      .backgroundColor('#a3cf62')

      Row() {

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_04')
          .selected(this.index)
          .value(this.text + '4')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 4 onFocus.'
          })

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_05')
          .selected(this.index)
          .value(this.text + '5')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 5 onFocus.'
          })

        Select([
          {
            value: 'aaa',
            icon: '/images/app_icon.png'
          },
          {
            value: 'bbb',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ccc',
            icon: '/images/app_icon.png'
          },
          {
            value: 'ddd',
            icon: '/images/app_icon.png'
          },
        ])
          .id(this.name + '_06')
          .selected(this.index)
          .value(this.text + '6')
          .font({
            size: 16,
            weight: 500
          })
          .fontColor('#182431')
          .selectedOptionFont({
            size: 16,
            weight: 400
          })
          .optionFont({
            size: 16,
            weight: 400
          })
          .space(this.space)
          .arrowPosition(this.arrowPosition)
          .menuAlign(
            MenuAlignType.START, {
            dx: 0,
            dy: 0
          })
          .optionWidth(200)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info('Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
          .onFocus(() => {
            this.message += '\nSelect 6 onFocus.'
          })

      }
      .justifyContent(FlexAlign.Center)
      .width('80%')
      .height('8.2%')
      .margin(20)
      .backgroundColor('#a3cf62')

      Text(this.message)
        .fontSize(10)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
      
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
