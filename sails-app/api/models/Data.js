/**
 * Data.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

 module.exports = {

   schema: true,

   attributes: {
     evaluationMethod: {
       type: 'string',
       enum: ['html', 'markdown', 'member', 'siteLink'],
       defaultsTo: 'html'
     },
     content: {
       type: 'json',
       required: true
     }
   }
 };
