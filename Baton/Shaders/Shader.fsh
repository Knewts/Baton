//
//  Shader.fsh
//  Baton
//
//  Created by Matthew Knewtson on 2/17/12.
//  Copyright 2012 Western Michigan University. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
