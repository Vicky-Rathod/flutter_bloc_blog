// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_bloc_blog/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i12;

import 'package:dartz/dartz.dart' as _i2;
import 'package:flutter_bloc_blog/core/failure.dart' as _i6;
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart'
    as _i7;
import 'package:flutter_bloc_blog/features/auth/domain/repositories/auth_repository.dart'
    as _i4;
import 'package:flutter_bloc_blog/features/blog/domain/entities/blogs.dart'
    as _i9;
import 'package:flutter_bloc_blog/features/blog/domain/repositories/blog_repository.dart'
    as _i8;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_2 extends _i1.SmartFake
    implements _i3.StreamedResponse {
  _FakeStreamedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i4.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithEmailAndPassword,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #signInWithEmailAndPassword,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> signUpWithEmailAndPassword({
    required String? email,
    required String? password,
    required String? username,
    required String? firstName,
    required String? lastName,
    required String? phoneNumber,
    required String? address,
    required String? city,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #signUpWithEmailAndPassword,
          [],
          {
            #email: email,
            #password: password,
            #username: username,
            #firstName: firstName,
            #lastName: lastName,
            #phoneNumber: phoneNumber,
            #address: address,
            #city: city,
          },
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #signUpWithEmailAndPassword,
            [],
            {
              #email: email,
              #password: password,
              #username: username,
              #firstName: firstName,
              #lastName: lastName,
              #phoneNumber: phoneNumber,
              #address: address,
              #city: city,
            },
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>> signInWithGoogle() =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithGoogle,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>.value(
            _FakeEither_0<_i6.Failure, _i7.AuthEntity>(
          this,
          Invocation.method(
            #signInWithGoogle,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>> signInWithFacebook() =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithFacebook,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>.value(
            _FakeEither_0<_i6.Failure, _i7.AuthEntity>(
          this,
          Invocation.method(
            #signInWithFacebook,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>> signInWithApple() =>
      (super.noSuchMethod(
        Invocation.method(
          #signInWithApple,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>.value(
            _FakeEither_0<_i6.Failure, _i7.AuthEntity>(
          this,
          Invocation.method(
            #signInWithApple,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>> signInAnonymously() =>
      (super.noSuchMethod(
        Invocation.method(
          #signInAnonymously,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>.value(
            _FakeEither_0<_i6.Failure, _i7.AuthEntity>(
          this,
          Invocation.method(
            #signInAnonymously,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>> signOut() =>
      (super.noSuchMethod(
        Invocation.method(
          #signOut,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>.value(
            _FakeEither_0<_i6.Failure, _i7.AuthEntity>(
          this,
          Invocation.method(
            #signOut,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.AuthEntity>>);
}

/// A class which mocks [BlogRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBlogRepository extends _i1.Mock implements _i8.BlogRepository {
  MockBlogRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> createBlog({
    required dynamic title,
    required dynamic author,
    required dynamic description,
    required dynamic url,
    required dynamic urlToImage,
    required dynamic publishedAt,
    required dynamic content,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #createBlog,
          [],
          {
            #title: title,
            #author: author,
            #description: description,
            #url: url,
            #urlToImage: urlToImage,
            #publishedAt: publishedAt,
            #content: content,
          },
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #createBlog,
            [],
            {
              #title: title,
              #author: author,
              #description: description,
              #url: url,
              #urlToImage: urlToImage,
              #publishedAt: publishedAt,
              #content: content,
            },
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> deleteBlog(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBlog,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #deleteBlog,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> updateBlog(
          {required String? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateBlog,
          [],
          {#id: id},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #updateBlog,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i9.BlogEntity>>> getBlogs() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBlogs,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i9.BlogEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i9.BlogEntity>>(
          this,
          Invocation.method(
            #getBlogs,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i9.BlogEntity>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, dynamic>> getBlogDetail(String? blogId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBlogDetail,
          [blogId],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, dynamic>>.value(
            _FakeEither_0<_i6.Failure, dynamic>(
          this,
          Invocation.method(
            #getBlogDetail,
            [blogId],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, dynamic>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i10.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i10.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i10.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i10.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<String>.value(_i11.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i12.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i12.Uint8List>.value(_i12.Uint8List(0)),
      ) as _i5.Future<_i12.Uint8List>);

  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}