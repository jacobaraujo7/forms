import 'package:backend/src/generated/prisma_client.dart';

class ClientRepository {
  final PrismaClient prisma;

  ClientRepository(this.prisma);

  Future<List<Client>> getAll() async {
    final clients = await prisma.client.findMany();
    return clients;
  }

  Future<Client?> get(int id) async {
    final client = await prisma.client.findFirst(
      where: ClientWhereInput(
        id: PrismaUnion.one(id),
      ),
    );
    return client;
  }

  Future<Client> create(ClientCreateInput input) async {
    final client = await prisma.client.create(
      data: PrismaUnion.zero(input),
    );
    return client;
  }

  Future<Client?> update(int id, ClientUpdateInput input) async {
    final client = await prisma.client.update(
      data: PrismaUnion.zero(input),
      where: ClientWhereUniqueInput(
        id: id,
      ),
    );
    return client;
  }

  Future<Client?> delete(int id) async {
    final client = await prisma.client.delete(
      where: ClientWhereUniqueInput(id: id),
    );
    return client;
  }
}
