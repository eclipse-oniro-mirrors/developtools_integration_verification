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
import { matrix4 } from '@kit.ArkUI';

class ImageModifier implements AttributeModifier<ImageAttribute> {
  public translateX: number = 0;
  public translateY: number = 0;

  applyNormalAttribute(instance: ImageAttribute): void {
    let matrix2: ImageMatrix = matrix4.identity()
      .translate({
        x: this.translateX,
        y: this.translateY
      });
    instance.imageMatrix(matrix2);
  }
}

@Entry
@Component
struct UIComponentMediaImageSupportThumbnails0013 {
  @State name: string = 'UIComponentMediaImageSupportThumbnails0013';
  @State message: string = 'UIComponentMediaImageSupportThumbnails0013';
  @State translateX: number = 0;
  @State translateY: number = 0;
  @State modifier: ImageModifier = new ImageModifier();
  @State matrix1: ImageMatrix = matrix4.identity()
    .translate({
      x: this.translateX,
      y: this.translateY
    })

  build() {
    Row() {
      Column() {
        Text('===原生调用===')

        Text('png图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.png'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('jpg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('jpeg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpeg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('webp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.webp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('gif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.gif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('bmp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.bmp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)

        Text('heif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.heif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .imageMatrix(this.matrix1)
          .backgroundColor(Color.Orange)
      }

      Column() {
        Button('X轴平移-20000')
          .onClick(() => {
            this.translateX = -20000;
            this.modifier.translateX = -20000;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('X轴平移-155.5')
          .onClick(() => {
            this.translateX = -155.5;
            this.modifier.translateX = -155.5;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('X轴平移-100')
          .onClick(() => {
            this.translateX = -100;
            this.modifier.translateX = -100;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('X轴平移0')
          .onClick(() => {
            this.translateX = 0;
            this.modifier.translateX = 0;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('X轴平移100')
          .onClick(() => {
            this.translateX = 100;
            this.modifier.translateX = 100;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)
          .id(this.name + '_01')

        Button('X轴平移20000')
          .onClick(() => {
            this.translateX = 20000;
            this.modifier.translateX = 20000;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('Y轴平移-20000')
          .onClick(() => {
            this.translateY = -20000;
            this.modifier.translateY = -20000;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('Y轴平移-155.5')
          .onClick(() => {
            this.translateY = -155.5;
            this.modifier.translateY = -155.5;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('Y轴平移-100')
          .onClick(() => {
            this.translateY = -100;
            this.modifier.translateY = -100;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('Y轴平移0')
          .onClick(() => {
            this.translateY = 0;
            this.modifier.translateY = 0;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)

        Button('Y轴平移100')
          .onClick(() => {
            this.translateY = 100;
            this.modifier.translateY = 100;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)
          .id(this.name + '_02')

        Button('Y轴平移20000')
          .onClick(() => {
            this.translateY = 20000;
            this.modifier.translateY = 20000;
            this.matrix1 = matrix4.identity()
              .translate({
                x: this.translateX,
                y: this.translateY
              })
          })
          .margin(5)
      }

      Column() {
        Text('===Modifier调用===')

        Text('png图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.png'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('jpg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('jpeg图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.jpeg'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('webp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.webp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('gif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.gif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('bmp图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.bmp'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)

        Text('heif图片:')
        Image(('https://' + 'gitee.com' + '/drthrhr/test-resources/raw/testResources/image.heif'))
          .objectFit(ImageFit.MATRIX)
          .width(90)
          .height(90)
          .attributeModifier(this.modifier)
          .backgroundColor(Color.Orange)
      }

    }
    .width('100%')
    .height('100%')
  }
}
