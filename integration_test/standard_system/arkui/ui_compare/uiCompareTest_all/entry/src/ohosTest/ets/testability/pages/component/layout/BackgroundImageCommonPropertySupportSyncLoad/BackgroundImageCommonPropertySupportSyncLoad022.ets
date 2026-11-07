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
struct BackgroundImageCommonPropertySupportSyncLoad022 {
  @State name: string = 'BackgroundImageCommonPropertySupportSyncLoad022';
  @State message: string = this.name;
  @State imgSrc: string = ('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/bigImage.jpg');
  @State imgType: string = 'JPG';
  @State imgInfo: string = '图片资源类型： ';

  build() {
    Column() {
      Text(this.message)
        .margin(10)

      Text(this.imgInfo)
        .margin(10)

      Button('图片资源多类型确认')
        .id(this.name + '_01')
        .onClick(() => {
          this.imgInfo = `图片资源类型： ${this.imgType}`;
        })
        .backgroundColor(0x317aff)
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })

      Button('切换图片类型')
        .id(this.name + '_02')
        .onClick(() => {
          this.imgSrc = ('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.png');
          this.imgType = 'PNG';
          this.imgInfo = `图片资源类型： ${this.imgType}`;
        })
        .backgroundColor(0x317aff)
        .margin({
          top: 5,
          bottom: 5,
          left: 10,
          right: 10
        })

      Column()
        .width('90%')
        .height('60%')
        .backgroundImage(this.imgSrc, {
          repeat: ImageRepeat.XY
        })
        .border({
          width: 5,
          color: Color.Green,
          radius: 10,
          style: BorderStyle.Dotted
        })
    }
    .width('100%')
    .height('100%')
    .margin({
      top: 5,
      bottom: 10,
      left: 8,
      right: 8
    })
  }
}
