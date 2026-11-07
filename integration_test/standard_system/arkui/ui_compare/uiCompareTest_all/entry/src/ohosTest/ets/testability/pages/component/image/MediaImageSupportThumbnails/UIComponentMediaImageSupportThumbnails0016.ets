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
  public rotateX: number = 0;
  public rotateY: number = 0;
  public centerX: number = 0;
  public centerY: number = 0;
  public angle: number = 0;

  applyNormalAttribute(instance: ImageAttribute): void {
    let matrix2: ImageMatrix = matrix4.identity()
      .rotate({
        x: this.rotateX,
        y: this.rotateY,
        centerX: this.centerX,
        centerY: this.centerY,
        angle: this.angle
      })
    instance.imageMatrix(matrix2);
  }
}

@Entry
@Component
struct UIComponentMediaImageSupportThumbnails0016 {
  @State name: string = 'UIComponentMediaImageSupportThumbnails0016';
  @State message: string = 'UIComponentMediaImageSupportThumbnails0016';
  @State centerX: number = 0;
  @State centerY: number = 0;
  @State rotateX: number = 0;
  @State rotateY: number = 0;
  @State angle: number = 0;
  @State modifier: ImageModifier = new ImageModifier();
  @State matrix1: ImageMatrix = matrix4.identity()
    .rotate({
      x: this.rotateX,
      y: this.rotateY,
      centerX: this.centerX,
      centerY: this.centerY,
      angle: this.angle
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
        Button('旋转轴X坐标-10000')
          .onClick(() => {
            this.rotateX = -10000;
            this.modifier.rotateX = -10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标-10')
          .onClick(() => {
            this.rotateX = -10;
            this.modifier.rotateX = -10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标-0.5')
          .onClick(() => {
            this.rotateX = -0.5;
            this.modifier.rotateX = -0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标0')
          .onClick(() => {
            this.rotateX = 0;
            this.modifier.rotateX = 0;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标0.5')
          .onClick(() => {
            this.rotateX = 0.5;
            this.modifier.rotateX = 0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})


        Button('旋转轴X坐标1')
          .onClick(() => {
            this.rotateX = 1;
            this.modifier.rotateX = 1;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标5')
          .onClick(() => {
            this.rotateX = 5;
            this.modifier.rotateX = 5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .id(this.name + '_01')
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标10')
          .onClick(() => {
            this.rotateX = 10;
            this.modifier.rotateX = 10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴X坐标10000')
          .onClick(() => {
            this.rotateX = 10000;
            this.modifier.rotateX = 10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标-10000')
          .onClick(() => {
            this.rotateY = -10000;
            this.modifier.rotateY = -10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标-10')
          .onClick(() => {
            this.rotateY = -10;
            this.modifier.rotateY = -10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标-0.5')
          .onClick(() => {
            this.rotateY = -0.5;
            this.modifier.rotateY = -0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标0')
          .onClick(() => {
            this.rotateY = 0;
            this.modifier.rotateY = 0;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标0.5')
          .onClick(() => {
            this.rotateY = 0.5;
            this.modifier.rotateY = 0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})


        Button('旋转轴Y坐标1')
          .onClick(() => {
            this.rotateY = 1;
            this.modifier.rotateY = 1;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .id(this.name + '_02')
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标5')
          .onClick(() => {
            this.rotateY = 5;
            this.modifier.rotateY = 5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标10')
          .onClick(() => {
            this.rotateY = 10;
            this.modifier.rotateY = 10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转轴Y坐标10000')
          .onClick(() => {
            this.rotateY = 10000;
            this.modifier.rotateY = 10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})
      }
      // .width('20%')

      Column() {
        Button('X轴中心点-10000')
          .onClick(() => {
            this.centerX = -10000;
            this.modifier.centerX = -10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点-10')
          .onClick(() => {
            this.centerX = -10;
            this.modifier.centerX = -10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点-0.5')
          .onClick(() => {
            this.centerX = -0.5;
            this.modifier.centerX = -0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点0')
          .onClick(() => {
            this.centerX = 0;
            this.modifier.centerX = 0;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点0.5')
          .onClick(() => {
            this.centerX = 0.5;
            this.modifier.centerX = 0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})


        Button('X轴中心点1')
          .onClick(() => {
            this.centerX = 1;
            this.modifier.centerX = 1;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点5')
          .onClick(() => {
            this.centerX = 5;
            this.modifier.centerX = 5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .id(this.name + '_03')
          .size({height: '1%', width: '1%'})

        Button('X轴中心点10')
          .onClick(() => {
            this.centerX = 10;
            this.modifier.centerX = 10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('X轴中心点10000')
          .onClick(() => {
            this.centerX = 10000;
            this.modifier.centerX = 10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-10000')
          .onClick(() => {
            this.centerY = -10000;
            this.modifier.centerY = -10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-10')
          .onClick(() => {
            this.centerY = -10;
            this.modifier.centerY = -10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点-0.5')
          .onClick(() => {
            this.centerY = -0.5;
            this.modifier.centerY = -0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点0')
          .onClick(() => {
            this.centerY = 0;
            this.modifier.centerY = 0;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点0.5')
          .onClick(() => {
            this.centerY = 0.5;
            this.modifier.centerY = 0.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})


        Button('Y轴中心点1')
          .onClick(() => {
            this.centerY = 1;
            this.modifier.centerY = 1;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点5')
          .onClick(() => {
            this.centerY = 5;
            this.modifier.centerY = 5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .id(this.name + '_04')
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点10')
          .onClick(() => {
            this.centerY = 10;
            this.modifier.centerY = 10;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('Y轴中心点10000')
          .onClick(() => {
            this.centerY = 10000;
            this.modifier.centerY = 10000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})
      }
      // .width('20%')

      Column() {
        Button('旋转角度-120000')
          .onClick(() => {
            this.angle = -120000;
            this.modifier.angle = -120000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转角度-90')
          .onClick(() => {
            this.angle = -90;
            this.modifier.angle = -90;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转角度-45')
          .onClick(() => {
            this.angle = -45;
            this.modifier.angle = -45;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转角度0')
          .onClick(() => {
            this.angle = 0;
            this.modifier.angle = 0;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转角度30')
          .onClick(() => {
            this.angle = 30;
            this.modifier.angle = 30;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})


        Button('旋转角度60.5')
          .onClick(() => {
            this.angle = 60.5;
            this.modifier.angle = 60.5;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})

        Button('旋转角度120')
          .onClick(() => {
            this.angle = 120;
            this.modifier.angle = 120;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .id(this.name + '_05')
          .size({height: '1%', width: '1%'})

        Button('旋转角度120000')
          .onClick(() => {
            this.angle = 120000;
            this.modifier.angle = 120000;
            this.matrix1 = matrix4.identity()
              .rotate({
                x: this.rotateX,
                y: this.rotateY,
                centerX: this.centerX,
                centerY: this.centerY,
                angle: this.angle
              })
          })
          .size({height: '1%', width: '1%'})
      }
      // .width('20%')

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
      // .width('20%')

    }
    .width('100%')
    .height('100%')
  }
}
