create trigger InsertTrigger on ��ʦ�� for insert as
begin
insert into ��ʦ��_����(��ʦ���,��ʦְ��,��ʦ����,��ʦн��) values ((select ��ʦ��� from inserted),(select ��ʦְ�� from inserted),(select ��ʦ���� from inserted),(select ��ʦн�� from inserted))
end
--����inserted�⻹��deleted�����Ķ�̬�������ڻ�ȡ����
--��������õ��˴������Ĺ���